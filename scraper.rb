#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
require 'pry'

names_ca = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://ca.wikipedia.org/wiki/Consellers_generals_d%27Andorra_(VII_Legislatura)',
  xpath: '//table[.//th[.="Nom"]]//td[1]//a[not(@class="new")]/@title',
) 

names_fr = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://fr.wikipedia.org/wiki/Huiti%C3%A8me_l%C3%A9gislature_d%27Andorre',
  after: '//h2[contains(.,"Liste des conseillers")]',
  before: '//h2[contains(.,"Voir aussi")]',
  xpath: './/li//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { ca: names_ca, fr: names_fr }, output: true)
warn EveryPolitician::Wikidata.notify_rebuilder


