Rails.application.routes.draw do
  root 'ledger#display'
  get 'ledger/display'
  post 'ledger/upload_file', to: 'ledger#upload_file', as: :upload_file
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
