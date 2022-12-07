defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> String.trim() |> String.first()

  def initial(name), do: name |> first_letter() |> String.capitalize() |> Kernel.<>(".")

  def initials(full_name) do
    [name, surname] = String.split(full_name, " ")
    "#{initial(name)} #{initial(surname)}"
  end

  def pair(full_name1, full_name2) do
    ~s"""
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
