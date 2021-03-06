require 'spec_helper'

describe SlackRubyBot::Loggable do
  let! :class_with_logger do
    Class.new(SlackRubyBot::Commands::Base) do
      def public_logger
        logger
      end
    end
  end
  describe 'logger for class' do
    it do
      expect(class_with_logger.logger).to be_kind_of Logger
    end
    it 'should be cached' do
      first_logger = class_with_logger.logger
      second_logger = class_with_logger.logger
      expect(first_logger.object_id).to eq second_logger.object_id
    end
  end
  describe 'logger for instance' do
    it do
      expect(class_with_logger.new.public_logger).to be_kind_of Logger
    end
    it 'should be cached' do
      first_logger = class_with_logger.new.public_logger
      second_logger = class_with_logger.new.public_logger
      expect(first_logger.object_id).to eq second_logger.object_id
    end
  end
end
