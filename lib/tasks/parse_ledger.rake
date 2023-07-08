require 'json'
# To run the rake task - rails parse_ledger:concatenated_task

namespace :parse_ledger do
  desc 'Parse and load the ledger data'

  task complicated_ledger: :environment do
    file_path = Rails.root.join('public', 'json', 'complicated_ledger.json')

    begin
      json_data = File.read(file_path)
      ledger_entries = JSON.parse(json_data)

      # Process and save each transaction
      ledger_entries.each do |entry|
        transaction = Transaction.new(
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

      puts 'Ledger data loaded successfully.'
    rescue StandardError => e
      puts "Error loading ledger data: #{e.message}"
    end
  end

  task duplicate_ledger: :environment do
    file_path = Rails.root.join('public', 'json', 'duplicate_ledger.json')

    begin
      json_data = File.read(file_path)
      ledger_entries = JSON.parse(json_data)

      # Process and save each transaction
      ledger_entries.each do |entry|
        transaction = Transaction.new(
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

      puts 'Ledger data loaded successfully.'
    rescue StandardError => e
      puts "Error loading ledger data: #{e.message}"
    end
  end

  task concatenated_task: :environment do
    # Clear existing transactions (optional)
    Transaction.delete_all

    Rake::Task['parse_ledger:complicated_ledger'].invoke
    Rake::Task['parse_ledger:duplicate_ledger'].invoke
  end
end
