ActiveAdmin.register Micropost do
  permit_params :content, :user_id, :post_id
end
