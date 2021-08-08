module Discover
  def verify_trending_div(arr)
    raise 'Not enough or no trending stories are being returned' if arr.count == 0 || arr.count < 6

    expect(arr.count).to eq(6)
  end

  def verify_new_releases_div(arr)
    raise 'Not enough or no new release stories are being returned' if arr.count == 0 || arr.count < 6

    expect(arr.count).to eq(6)
  end
end
