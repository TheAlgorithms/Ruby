require 'minitest/autorun'
require_relative 'boyer_moore_horspool_search'

class TestBoyerMooreHorspoolSearch < Minitest::Test
  def test_first_match_returns_negative_index_if_no_match
    assert first_match_index('abcdefghijk', 'defz') < 0
  end

  def test_first_match_returns_first_match_index
    assert first_match_index('abcdefghijkghilmno', 'ghi') == 6
  end

  def test_match_indices_returns_empty_list_if_no_match
    assert matches_indices('abcdefghijk', 'defz').empty?
  end

  def test_match_indices_returns_list_of_match_indices
    assert matches_indices('abcdefghijkghilmno', 'ghi') == [6, 11]
  end
end
