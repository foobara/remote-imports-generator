require "foobara/rack_connector"

rack_connector = Foobara::CommandConnectors::RackConnector.new

RESQUE_SCHEDULER_CONNECTOR = rack_connector

# Connecting commands gives an AsyncAt version of the command.
# rack_connector.connect(SomeCommandOrDomainOrOrganization)

rack_connector.cron(
  [
    #   Minute (0-59)
    #   | Hour (0-23)
    #   | | Day-of-Month (1-31)
    #   | | | Month (1-12)
    #   | | | | Day-of-Week (0-6)
    #   | | | | | Timezone
    #   | | | | | | Command, Inputs
    # ["* * * * *", SomeCommand]
  ]
)
