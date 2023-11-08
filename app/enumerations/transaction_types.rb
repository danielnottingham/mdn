# frozen_string_literal: true

class TransactionTypes < EnumerateIt::Base
  associate_values :expense, :income
end
