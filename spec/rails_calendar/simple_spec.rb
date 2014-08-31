I18n.backend.store_translations :test,
  date: {
    abbr_day_names: [
      'A', 'B', 'C', 'D', 'E', 'F', 'G'
    ]
  }

I18n.locale = :test

describe RailsCalendar::Simple, type: :feature do
  before do
    @calendar = RailsCalendar::Simple.new
  end

  describe '#header' do
    before do
      @header = @calendar.send(:header)
    end

    it 'should render a th tag for every day of the week' do
      expect(@header).to have_selector('thead > tr > th', count: 7)
    end

    it 'should set the names of the days in each th' do
      I18n.t('date.abbr_day_names').each do |day|
        expect(@header).to have_selector('th', text: day.titleize)
      end
    end
  end

  describe '#day_cell(date)' do
    it 'should render a td tag with the date day number' do
      date = Date.strptime('1900-01-20')
      cell = @calendar.send(:day_cell, date)
      expect(cell).to have_selector('td', text: '20')
    end
  end
end
