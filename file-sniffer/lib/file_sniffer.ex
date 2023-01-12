defmodule FileSniffer do
  @exe_signature <<0x7F, 0x45, 0x4C, 0x46>>
  @bmp_signature <<0x42, 0x4D>>
  @png_signature <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>
  @jpg_signature <<0xFF, 0xD8, 0xFF>>
  @gif_signature <<0x47, 0x49, 0x46>>

  @files [
    {"exe", "application/octet-stream", @exe_signature},
    {"bmp", "image/bmp", @bmp_signature},
    {"png", "image/png", @png_signature},
    {"jpg", "image/jpg", @jpg_signature},
    {"gif", "image/gif", @gif_signature}
  ]

  def type_from_extension(extension) do
    Enum.find_value(@files, fn {ext, type, _} -> if ext == extension, do: type end)
  end

  def type_from_binary(file_binary) do
    Enum.find_value(@files, fn {_, type, signature} ->
      if String.starts_with?(file_binary, signature), do: type
    end)
  end

  def verify(file_binary, extension) do
    type = type_from_binary(file_binary)

    if type == type_from_extension(extension) do
      {:ok, type}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
