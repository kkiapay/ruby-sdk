require "net/http"
require "net/https"
require "json"
require "uri"

BASE_URL = "https://api.kkiapay.me"
SANDBOX_URL = "https://api-sandbox.kkiapay.me"

def make_request(uri, transaction_id, headers)
    begin
        https = Net::HTTP.new(uri.host,uri.port)
        https.use_ssl = true
        req = Net::HTTP::Post.new(uri.path, initheader=headers)
        req.body = {
            "transactionId" => transaction_id
        }.to_json
        res = https.request(req)
        res.body
    rescue e
        e
    end
end

class Kkiapay

    def initialize(public_key, private_key, secret, sandbox=false)
        @headers =  {
            "Accept" => "application/json",
            "Content-Type" => "application/json",
            "X-SECRET-KEY" => secret,
            "X-API-KEY"=> public_key,
            "X-PRIVATE-KEY"=> private_key,
        }

        @url = sandbox ? SANDBOX_URL : BASE_URL
    end

    def verify_transaction(transaction_id)
        transaction_url = URI.parse(@url + "/api/v1/transactions/status")
        response = make_request(transaction_url, transaction_id, @headers)
        response
    end

    def refund_transaction(transaction_id)
        transaction_url = URI.parse(@url + "/api/v1/transactions/revert")
        response = make_request(transaction_url, transaction_id, @headers)
        response
    end

    def setup_payout(options)
        transaction_url = URI.parse(@url + "/merchant/payouts/schedule")
        response = make_request(transaction_url, transaction_id, @headers)
        response
    end
end
