Rails.application.config.middleware.use OmniAuth::Builder do

  provider :twitter, "ng0uVs4WFKtCmHpKGWiin5opC", "OYcs2rpq462Z5hOuY40o8c6IwDi5qxZNnFrn4kXNmEqbut7Q2x"
  provider :facebook, "523604157749992", "1a991c38ef00cf6c8a738df69f3ec99d", scope: "email, user_birthday, publish_actions"
  provider :github, "d2ad3563e7b6a87c0bc6", "5dc448a0d752955981eca12fc273ae7b3ebbf71f"
end