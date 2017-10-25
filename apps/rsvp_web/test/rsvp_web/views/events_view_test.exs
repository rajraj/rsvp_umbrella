defmodule RsvpWeb.EventsViewTest do
  use RsvpWeb.ConnCase, async: true

  @tag current: true
  test "should format start at datetime" do
    {_, start_at} = NaiveDateTime.from_erl({{2017, 10, 29}, {10, 30, 00}})
    formated_date = RsvpWeb.EventsView.format_start_at(start_at)
    assert formated_date == "29/10/2017 at 10:30"
  end
end
