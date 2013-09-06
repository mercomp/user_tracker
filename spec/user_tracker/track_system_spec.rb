require "spec_helper"

describe UserTracker::AnalyticsTrackSystem do
  let(:system) { UserTracker::AnalyticsTrackSystem.new("secret_key") }

  it "should initialize" do
    allow(Analytics).to receive(:init)
    allow(Analytics).to receive(:identify)
    allow(Analytics).to receive(:track)

    expect(Analytics).to receive(:init).ordered.
      with(secret: "secret_key")
    expect(Analytics).to receive(:identify).ordered.
      with(user_id: User.instance.id, traits: { name: User.instance.name, email: User.instance.email })
    expect(Analytics).to receive(:track).ordered.
      with(user_id: User.instance.id, event: "New event", properties: { test: true })

    system.track("New event", User.instance, { test: true })
  end 
end