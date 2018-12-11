require "application_system_test_case"

class CommunitiesTest < ApplicationSystemTestCase
  setup do
    @community = communities(:one)
  end

  test "visiting the index" do
    visit communities_url
    assert_selector "h1", text: "Communities"
  end

  test "creating a Community" do
    visit communities_url
    click_on "New Community"

    fill_in "Ciudad", with: @community.ciudad
    fill_in "Comuna", with: @community.comuna
    fill_in "Direccion", with: @community.direccion
    fill_in "Email", with: @community.email
    fill_in "Fecha constitution", with: @community.fecha_constitution
    fill_in "Imagen", with: @community.imagen
    fill_in "Logo", with: @community.logo
    fill_in "Nombre", with: @community.nombre
    fill_in "Pais", with: @community.pais
    fill_in "Region", with: @community.region
    fill_in "Rut", with: @community.rut
    fill_in "Telefono1", with: @community.telefono1
    fill_in "Telefono2", with: @community.telefono2
    click_on "Create Community"

    assert_text "Community was successfully created"
    click_on "Back"
  end

  test "updating a Community" do
    visit communities_url
    click_on "Edit", match: :first

    fill_in "Ciudad", with: @community.ciudad
    fill_in "Comuna", with: @community.comuna
    fill_in "Direccion", with: @community.direccion
    fill_in "Email", with: @community.email
    fill_in "Fecha constitution", with: @community.fecha_constitution
    fill_in "Imagen", with: @community.imagen
    fill_in "Logo", with: @community.logo
    fill_in "Nombre", with: @community.nombre
    fill_in "Pais", with: @community.pais
    fill_in "Region", with: @community.region
    fill_in "Rut", with: @community.rut
    fill_in "Telefono1", with: @community.telefono1
    fill_in "Telefono2", with: @community.telefono2
    click_on "Update Community"

    assert_text "Community was successfully updated"
    click_on "Back"
  end

  test "destroying a Community" do
    visit communities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Community was successfully destroyed"
  end
end
