# app/services/lambda_invoker.rb
require "aws-sdk-lambda"

class ReceiverStart
  def initialize
    @client = Aws::Lambda::Client.new(region: ENV["AWS_REGION"])
  end

  def invoke_function(file_key, equipment_id, user_id)
    payload = {
      message: "File equipmented successfully",
      equipment_id: equipment_id,
      user_id: user_id,
      file_key: file_key,
      bucket_name: "#{ENV['APP_NAME_PRIVATE']}-#{Rails.env}",
      stage: "#{Rails.env}"
    }.to_json

    response = @client.invoke({
      function_name: "#{ENV['APP_NAME_PRIVATE']}-receiver_start-#{Rails.env}",
      invocation_type: "Event",
      payload: payload
    })
    Rails.logger.info("Lambda function invoked: #{response}")
  rescue StandardError => e
    Rails.logger.error("Error invoking Lambda function: #{e.message}")
  end
end
