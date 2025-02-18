require 'queencheck/core'

describe QueenCheck do
  before(:each) do
    @checker = QueenCheck.new(3, :+, Integer)
  end

  it 'quick test' do
    ret = @checker.run do | result, arguments |
      result.should == 3 + arguments[0]
    end

    ret.examples.should eq(100)
    ret.passed.should eq(100)
    ret.failures.should eq(0)
  end

  it 'exception' do
    div = QueenCheck(5, :/, Integer)

    ret = div.run do | result, arguments, error |
      if error
        error.should be_kind_of(ZeroDivisionError)
      else
        result.should eq(5 / arguments[0])
      end
    end

    ret.examples.should eq(100)
    ret.passed.should eq(100)
  end
end

