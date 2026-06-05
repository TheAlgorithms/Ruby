# frozen_string_literal: true

# Calculates Return on Investment (ROI) as a percentage.
# ROI measures the profitability of an investment relative to its cost.
#
# Formula: ROI = (Gain - Cost) / Cost * 100
# Reference: https://www.investopedia.com/terms/r/returnoninvestment.asp
class ReturnOnInvestment
  def self.call(gain_from_investment, cost_of_investment)
    raise ArgumentError, 'cost_of_investment must be greater than 0' if cost_of_investment <= 0

    (gain_from_investment - cost_of_investment).to_f / cost_of_investment * 100
  end
end
