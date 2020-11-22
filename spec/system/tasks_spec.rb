require "rails_helper"

describe "タスク管理", type: :system do
  describe "一覧表示" do
    before do
      let!(:user_a) {FactoryBot.build(:users)}
      let!(:task_a) {FactoryBot.build(:tasks)}
    end
      
    context "ユーザAがログインしていた場合" do
      before do
        visit session_path
        fill_in "email", with: user_a.email
        fill_in "password_digest", with: user_a.password_digest
        click_button "ログインする"
        visit tasks_path
      end

      it "タスクAが見れる" do
        expect(page).to have_content task_a.name
      end
    end
  end
end
