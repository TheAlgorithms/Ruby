##
# This class represents a table of {bad_match_character => slide_offset}
# to be used in Boyer-Moore-Horspool substring finding algorithm.

class BadMatchTable

    attr_reader :pattern
    attr_reader :table

    def initialize(pattern)
        @pattern = pattern
        @table = {}
        for i in 0...pattern.size
            @table[pattern[i]] = pattern.size - 1 - i
        end
    end

    ##
    # Given a mismatch character belonging to the search string, returns
    # the offset to be used when sliding the pattern towards the right.

    def slide_offset(mismatch_char)
        table.fetch(mismatch_char, pattern.size)
    end
end

##
# Returns the first starting index of the given pattern's occurrence (as a substring)
# in the provided search string if a match is found, -1 otherwise.

def first_match_index(search_string, pattern)
    matches = matches_indices(search_string, pattern, true)
    matches.empty? ? -1 : matches[0]
end

##
# Returns the list of starting indices of the given pattern's occurrences (as a substring)
# in the provided search string.
# If no match is found, an empty list is returned.
# If `stop_at_first_match` is provided as `true`, the returned list will contain at most one element,
# being the leftmost encountered match in the search string.

def matches_indices(search_string, pattern, stop_at_first_match=false)
    table = BadMatchTable.new(pattern)
    i = pattern.size - 1
    indices = []
    while i < search_string.size
        for j in 0...pattern.size
            if search_string[i-j] != pattern[pattern.size-1-j]
                i += table.slide_offset(search_string[i-j])
                break
            elsif j == pattern.size-1
                indices.append(i-j)
                return indices if stop_at_first_match
                i += 1
            end
        end
    end
    indices
end
