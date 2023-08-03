class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def serialize
    { errors: [{ title: @error.title, detail: @error.detail }] }
  end
end
