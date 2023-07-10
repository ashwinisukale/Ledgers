class LedgerController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:upload_file]

  def display
    @transactions = EquityTransaction.order(date: :desc).distinct
    @balance = @transactions.first ? @transactions.first.balance : 0 
  end

  def upload_file
    file = params[:ledger_file]
    if file.present? && file.content_type == 'application/json'
      json_data = file.read
      ledger_entries = JSON.parse(json_data)
      # Process and save the ledger_entries as transactions
      ledger_entries.each do |entry|
        transaction = EquityTransaction.new(
          activity_id: entry['activity_id'],
          date: entry['date'],
          transaction_type: entry['type'],
          method: entry['method'],
          amount: entry['amount'],
          balance: entry['balance']
        )
        if entry['requester']
          transaction[:requester_type] = entry['requester']['type']
        end

        if entry['source']
          transaction[:source_type] = entry['source']['type'],
          transaction[:source_id]  = entry['source']['id'],
          transaction[:source_description] = entry['source']['description']
        end
        if entry['destination']
          transaction[:destination_type] = entry['destination']['type'],
          transaction[:destination_id] = entry['destination']['id'],
          transaction[:destination_description] = entry['destination']['description']
        end

        transaction.save
      end

      flash[:notice] = 'File uploaded successfully.'
    else
      flash[:alert] = 'Invalid file format. Please upload a JSON file.'
    end

    redirect_to ledger_display_path
  end
end
