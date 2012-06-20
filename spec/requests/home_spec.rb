require 'spec_helper'


describe "Home" do

  # her sign in new session oluyor ve database siliniyor.

  def sign_in_first
    visit root_path
    find("img[@alt='image-twitter-login']").click
    fill_in "username_or_email", with: "tefecidefteri@gmail.com"
    fill_in "password", with: "475tefeci"
    click_on("allow")
    visit root_path
  end
  def sign_in_current
    visit root_path
    find("img[@alt='image-twitter-login']").click
    click_on("allow")
  end

  def fill_friend
    fill_in "friend_name", with: "Testname"
    fill_in "friend_surname", with: "TestSurname"
    fill_in "friend_email", with: "test@email.com"

  end


  def fill_credit
    fill_in "credit_miktar", with: "3000"
    select '2011', :from => 'credit_ver_tarih_1i'
    select 'July', :from => 'credit_ver_tarih_2i'
    select '21', :from => 'credit_ver_tarih_3i'
   # select '2011/01/05', :from => 'credit_Vade_Tarihi'
    select "Odendi.", from: "credit_durum"
  end

  subject { page }
  describe "GET /home", :js => true do

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
      visit root_path
      page.should have_content("Defteri")
    end

    it "should login via twitter" do
      sign_in_first
      page.should have_content("Hosgeldin")
      page.should have_content("Arkadaslarim")

    end

    it "should visit Arkadaslarim page" do
      sign_in_current
      visit friends_path
      page.should have_content("Yeni Arkadas Ekle")
      click_on("+ Yeni Arkadas Ekle")
      page.find_field("friend_name").visible?.should be_true
      fill_friend
      click_button "Kaydet"

      page.should have_content("Adi : TESTNAME")
      page.should have_link("KISIYI SIL")
      page.should_not have_link("Borcu Sil")

      find("img[@alt='yeni_borc']").click
      page.find_field("credit_miktar").visible?.should be_true

      fill_credit
      click_button "Kaydet"

      page.should have_content("Odendi")
      page.should have_link("Borcu Sil")
      page.should have_link("Duzenle")
      page.should have_content("3000.0 TL")

      click_link ("Duzenle")
      fill_in "credit_miktar", :with => "4000"

      select "Odenmedi.", from: "credit_durum"
      click_on "Kaydet"
      page.should have_content("4000.0 TL")
      page.should have_content("Toplam Borcu : 4000.0TL")
      click_link "Borcu Sil"
      page.driver.browser.switch_to.alert.accept   #accepts confirmation alert
      page.should have_content("Toplam Borcu : 0 TL")

    end

    it "should show friends list" do
      sign_in_current
      visit new_friend_path
      fill_friend
      click_button "Kaydet"    #Arkadas olusturur
      visit friends_path
      page.should have_content("TESTNAME")      # tum arkadasları gosterir
      click_on ("arkadaslarim")                   #arkadaslar linkine tiklar
      page.should have_content("TESTNAME")       # tum arkadasları gosterir
      click_on ("KISIYI DUZENLE")
      page.should have_content("Arkadas Duzenle")
      page.find_field("friend_name").visible?.should be_true
      fill_in "friend_name", with: "TESTUPDATENAME"
      click_on "Kaydet"                                  #kisiyi update eder
      page.should have_content("Kisi Bilgileri")
      page.should have_content("Adi : TESTUPDATENAME")
      click_link ("KISIYI SIL")
      page.driver.browser.switch_to.alert.accept
      page.should have_link("+ Yeni Arkadas Ekle")
      page.should_not have_content("TESTUPDATENAME")

    end

    it " should raise an error message for invalid inputs" do
      sign_in_current
      visit new_friend_path
      fill_friend
      fill_in "friend_email", with: "wrongmail"
      click_on "Kaydet"
      page.should have_selector("div#error_explanation")
      fill_in "friend_email", with: "test@mail.com"
      click_on "Kaydet"
      page.should_not have_selector("div#error_explanation")
    end

    it "should logout successfully" do
      sign_in_current
      click_on "sign out"
      page.should_not have_content("Hosgeldin")
    end

    it "should not see friend list without login" do
      visit friends_path
      page.should_not have_content("Arkadaslarin")
    end

    it "should visit new friend path without login" do
      visit new_friend_path
      page.should_not have_field("friend_name")
    end
    it "should select the first friend from table to delete " do
      sign_in_current
      visit new_friend_path
      fill_friend
      click_on "Kaydet"
      visit new_friend_path
      fill_friend
      fill_in "friend_name", with:"secondtest"
      click_on "Kaydet"
      visit friends_path
      sleep(10)
      page.should have_content("secondtest")

    end

  end
end
