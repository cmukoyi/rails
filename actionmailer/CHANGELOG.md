*   Remove deprecated `ActionMailer::DeliveryJob` and `ActionMailer::Parameterized::DeliveryJob`
    in favor of `ActionMailer::MailDeliveryJob`.

    *Rafael Mendonça França*

*   `email_address_with_name` returns just the address if name is blank.

    *Thomas Hutterer*


## Rails 7.0.0.alpha2 (September 15, 2021) ##

*   No changes.


## Rails 7.0.0.alpha1 (September 15, 2021) ##

*   Configures a default of 5 for both `open_timeout` and `read_timeout` for SMTP Settings.

    *André Luis Leal Cardoso Junior*


Please check [6-1-stable](https://github.com/rails/rails/blob/6-1-stable/actionmailer/CHANGELOG.md) for previous changes.
