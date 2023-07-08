module LedgerHelper
  def min_transaction_date
    Transaction.minimum(:date).strftime("%m/%d/%Y") if Transaction.first
  end

  def max_transaction_date
    Transaction.maximum(:date).strftime("%m/%d/%Y") if Transaction.first
  end

  def description(transaction)
    "#{transaction.transaction_type.humanize} From #{transaction.source_description} to #{transaction.destination_description}"
  end
end
