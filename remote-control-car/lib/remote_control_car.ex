defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(nickname \\ "none"), do: %__MODULE__{nickname: nickname}

  def display_distance(%__MODULE__{distance_driven_in_meters: distance}), do: "#{distance} meters"

  def display_battery(%__MODULE__{battery_percentage: 0}), do: "Battery empty"

  def display_battery(%__MODULE__{battery_percentage: percentage}),
    do: "Battery at #{percentage}%"

  def drive(%__MODULE__{battery_percentage: 0} = remote_car), do: remote_car

  def drive(
        %__MODULE__{distance_driven_in_meters: distance, battery_percentage: percentage} =
          remote_car
      ) do
    %{remote_car | distance_driven_in_meters: distance + 20, battery_percentage: percentage - 1}
  end
end
