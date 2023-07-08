Rails.application.routes.draw do
  get 'dashboard/index'
  root 'ledger#display'
  get 'ledger/display'
  post 'ledger/upload_file', to: 'ledger#upload_file', as: :upload_file
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
