require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  
  # admin機能が使えるuserがuser_indexやowner_indexの画面に遷移することができるか
  # admin機能が使えないuserの場合、root_pathにredirectされているか
  # set_userやset_shopがbefore_loginで行われているか
  # admin機能が使えるuserの場合、user_update、user_destroyができるか

end
