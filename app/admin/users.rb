ActiveAdmin.register User do
  permit_params :name, :profile, :my_title, :email, :password, :password_confirmation
end
