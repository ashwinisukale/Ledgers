module LedgerHelper
  def min_transaction_date
    EquityTransaction.minimum(:date).strftime("%m/%d/%Y") if EquityTransaction.first
  end

  def max_transaction_date
    EquityTransaction.maximum(:date).strftime("%m/%d/%Y") if EquityTransaction.first
  end

  def description(transaction)
    "#{transaction.transaction_type.humanize} From #{transaction.source_description} to #{transaction.destination_description}"
  end
end
