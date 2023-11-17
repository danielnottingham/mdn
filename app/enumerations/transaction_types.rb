# frozen_string_literal: true

class TransactionTypes < EnumerateIt::Base
  associate_values(expense: -1, income: 1)
end
