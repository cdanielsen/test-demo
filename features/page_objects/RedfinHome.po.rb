class RedFinHomePage 
  attr_reader :emailSignInButton,
   :loginButton,
   :homePageTitleText,
   :loginFormEmailField,
   :loginFormPasswordField,
   :loginFormSubmitButton,
   :searchInputs,
   :searchSubmits
  
  def initialize
    @emailSignInButton = 'div.emailSignInButtonWrapper button'
    @loginButton = 'button[data-rf-test-name="SignInLink"]'
    @homePageTitleText = 'Redfin'
    @loginFormEmailField = 'input[name=emailInput]'
    @loginFormPasswordField = 'input[name=passwordInput]'
    @loginFormSubmitButton = 'div.SignInEmailForm button[data-rf-test-name=submitButton]'
    @searchInputs = 'input[data-rf-test-name=search-box-input]'
    @searchSubmits = 'button[data-rf-test-name=searchButton]'
  end
end