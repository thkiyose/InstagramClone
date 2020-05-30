module PostsHelper
  def confirm_or_not
    if action_name == 'new'|| action_name =='create'
      confirm_posts_path
    end
  end
end
