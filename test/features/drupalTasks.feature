
Feature: Behat tests for a clean install of the Drupal 7 standard profile. These
tests are meant both to verify the Drupal install as well as Behat test features
(like API access and JavaScript handling).

  Scenario: Ensure the Login link is available for anonymous users.
    Given I am an anonymous user
     When I am on the homepage
     Then I should see an "input#edit-name" element
      And I should see an "input#edit-pass" element

  @api
  Scenario: Ensure as a logged in user, I can log out.
    Given I am logged in as a user with the "authenticated user" role
     When I click "Log out"
     Then I should be on the homepage
      And I should see "User login"

  @api @javascript
  Scenario: Ensure the Reports page is loaded into an overlay when the Reports
  menu item is clicked.
    Given I am logged in as a user with the "administrator" role
     When I am on the homepage
      And I click "Reports"
     Then I should be on "#overlay=admin/reports"

  @wip
  Scenario: This is a broken test scenario, which should be excluded with the
  example Gruntconfig.json due to the wip tag.
    Given I am logged in as a user with the "xyz" role
     When I am on the xyz page
      And I click "Xyz"
     Then I should be on "abc"
