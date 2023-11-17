require_relative '../substrings' # Adjust the path according to your project structure

describe '#substrings' do
  let(:dictionary) { ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"] }

  it 'finds substrings in a single word' do
    expect(substrings("below", dictionary)).to eq({ "below" => 1, "low" => 1 })
  end

  it 'finds substrings in a sentence' do
    result = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
    expect(substrings("Howdy partner, sit down! How's it going?", dictionary)).to eq(result)
  end

  it 'is case insensitive' do
    expect(substrings("BeLow", dictionary)).to eq({ "below" => 1, "low" => 1 })
  end

  it 'handles empty strings' do
    expect(substrings("", dictionary)).to eq({})
  end

  it 'returns an empty hash if no substrings are found' do
    expect(substrings("xyz", dictionary)).to eq({})
  end

  it 'handles strings with no valid substrings' do
    expect(substrings("abcde", dictionary)).to eq({})
  end
end
