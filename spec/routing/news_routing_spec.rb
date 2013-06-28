require 'spec_helper'

describe 'News Routes' do
    it 'has nice routes' do
        expect(get: '/news').to route_to(controller: 'news', action: 'index')
        expect(get: '/news/2013/06/28/competitive-sports-fishing-league-announcement').to route_to(controller: 'news', action: 'story', year: '2013', month: '06', day: '28', title: 'competitive-sports-fishing-league-announcement')
    end
end