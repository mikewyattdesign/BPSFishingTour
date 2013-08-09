require 'spec_helper'

describe 'nameize function' do
    it 'should capitalize strings' do
        new_string = "lowercase".nameize
        expect(new_string).to eq("Lowercase")
    end

    it 'should capitalize after hyphens' do
        new_string = "lower-case".nameize
        expect(new_string).to eq("Lower-Case")
    end

    it 'should work correctly with Mc and Mac' do
        new_string = "mcdonald".nameize
        expect(new_string).to eq("McDonald")
        new_string = "macdonald".nameize
        expect(new_string).to eq("MacDonald")
    end
end
