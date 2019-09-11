ActiveAdmin.register Post do
  permit_params :title, :story, :order, :user_id
end
