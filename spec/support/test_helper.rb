module TestHelper
  def json
    JSON.parse(response.body)
  end
end
