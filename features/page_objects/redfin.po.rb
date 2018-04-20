class RedFinHomePage 
  attr_reader :emailSignInButton, :loginButton, :homePageTitleText, :loginFormEmailField, :loginFormPasswordField, :loginFormSubmitButton
  
  def initialize
    @emailSignInButton = 'div.emailSignInButtonWrapper button'
    @loginButton = 'button[data-rf-test-name="SignInLink"]'
    @homePageTitleText = 'Redfin'
    @loginFormEmailField = 'input[name=emailInput]'
    @loginFormPasswordField = 'input[name=passwordInput]'
    @loginFormSubmitButton = 'div.SignInEmailForm button[data-rf-test-name=submitButton]'
  end
end