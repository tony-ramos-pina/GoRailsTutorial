
class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!
    before_action :set_twitter_account, only: [:destroy] #This will create a before action defining who will use the method. prevents duplications
    
    def index
        @twitter_accounts = Current.user.twitter_accounts
    end

    def destroy
        #@twitter_account = Current.user.twitter_accounts.find(params[:id])  ---> this is substituted by the method set_twitter_account
        @twitter_account.destroy
        redirect_to twitter_accounts_path, notice: "Successfully disconnected @#{@twitter_account.username}"
    end

    
    
    private
    
    def set_twitter_account
        @twitter_account = Current.user.twitter_accounts.find(params[:id])
    end

end