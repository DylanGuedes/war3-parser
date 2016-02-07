defmodule War3Parser do

  def parse(path) do
    case File.open(path) do
      {:ok, pid} -> _parse(pid)
      {:error, reason} -> reason
    end
  end

  defp _parse(pid) do
    pid
    |> parse_header

  end

  defp seek_for(body, expression) do
  end

  def parse_header(pid) do
    {:ok, line} = :file.read_line(pid)
    "Warcraft III recorded game" <> <<0x01>> <> <<0>> <> rest = line
    rest
  end

  defp _convert_speed(0) do
    "Slow"
  end
  defp _convert_speed(1) do
    "Normal"
  end
  defp _convert_speed(2) do
    "Fast"
  end
  defp _convert_speed(_) do
    "Unknown"
  end

  defp _convert_visibility(0) do
    "Hide Terrain"
  end
  defp _convert_visibility(1) do
    "Map Explored"
  end
  defp _convert_visibility(2) do
    "Always Visible"
  end
  defp _convert_visibility(3) do
    "Default"
  end
  defp _convert_visibility(_) do
    "Unknown"
  end

  defp _convert_game_type(0x01) do
    "Ladder 1vs1/FFA"
  end
  defp _convert_game_type(0x09) do
    "Custom Game"
  end
  defp _convert_game_type(0x0D) do
    "Single player/Local game"
  end
  defp _convert_game_type(0x20) do
    "Ladder team game(AT/RT)"
  end
  defp _convert_game_type(_) do
    "Unknown"
  end

  defp _convert_color(0) do
    "red"
  end
  defp _convert_color(1) do
    "blue"
  end
  defp _convert_color(2) do
    "teal"
  end
  defp _convert_color(3) do
    "purple"
  end
  defp _convert_color(4) do
    "yellow"
  end
  defp _convert_color(5) do
    "orange"
  end
  defp _convert_color(6) do
    "green"
  end
  defp _convert_color(7) do
    "pink"
  end
  defp _convert_color(8) do
    "gray"
  end
  defp _convert_color(9) do
    "light-blue"
  end
  defp _convert_color(10) do
    "dark-green"
  end
  defp _convert_color(11) do
    "brown"
  end
  defp _convert_color(12) do
    "observer"
  end
  defp _convert_color(_) do
    "unknown"
  end

  defp _convert_race("hpea" <> <<0x01>> <> <<0x41>>) do
    "Human"
  end
  defp _convert_race("opeo" <> <<0x02>> <> <<0x42>>) do
    "Orc"
  end
  defp _convert_race("ewsp" <> <<0x04>> <> <<0x44>>) do
    "NightElf"
  end
  defp _convert_race("uaco" <> <<0x08>> <> <<0x48>>) do
    "Undead"
  end
  defp _convert_race(<<0x20>> <> <<0x60>>) do
    "Random"
  end
  defp _convert_race(_) do
    0
  end

  defp _convert_ai(0x00) do
    "Easy"
  end
  defp _convert_ai(0x01) do
    "Normal"
  end
  defp _convert_ai(0x02) do
    "Insane"
  end
  defp _convert_ai(_) do
    nil
  end

end
