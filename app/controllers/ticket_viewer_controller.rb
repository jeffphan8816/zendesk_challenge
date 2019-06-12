require 'rubygems'
require 'json'
require 'net/http'
require 'httparty'
  


class TicketViewerController < ApplicationController
  include HTTParty
  def alltickets
    auth = {:username => "jeffphan8816@gmail.com", :password => "Aq123ew4rft6yh@@"}
    @tickets = []
    base_url = 'https://jeffphan8816.zendesk.com/api/v2/tickets'
    @response = HTTParty.get(base_url, :basic_auth => auth).parsed_response
    if !@response['error'].nil?
      puts @response['error']
      flash[:notice] = "#{@response['error']}"
    else
      if @response['tickets'].first.nil?
        flash[:notice] = "There is no ticket at the moment!"
      else
        loop do
          getallticket(@response)
          if !@response['next_page'].nil?
            @response = HTTParty.get(@response['next_page'], :basic_auth => auth).parsed_response
          else
            break
          end
        end
      end
    end
  end
  
  def singleticket
    base_url = 'https://jeffphan8816.zendesk.com/api/v2/tickets'
    ticketid = params.permit(:id)
    base_url = base_url+'/'+ticketid['id']
    auth = {:username => "jeffphan8816@gmail.com", :password => "Aq123ew4rft6yh@@"}
    @response = HTTParty.get(base_url, :basic_auth => auth).parsed_response
    if !@response['error'].nil?
      puts @response['error']
      flash[:notice] = "#{@response['error']}"
    else
      @ticket = @response['ticket']
      if !@ticket.nil?  
        render 'ticket_viewer/singleticket', :locals => {:ticket => @ticket}
      end
    end
  end
  
  def getallticket(response)
    if !response['tickets'].nil?
      @response['tickets'].each do |t|
        @tickets.append(t)
      end
    end
  end
  
  def check_empty_input
    
  end
  
end

