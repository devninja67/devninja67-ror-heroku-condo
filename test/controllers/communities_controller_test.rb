require 'test_helper'

class CommunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community = communities(:one)
  end

  test "should get index" do
    get communities_url
    assert_response :success
  end

  test "should get new" do
    get new_community_url
    assert_response :success
  end

  test "should create community" do
    assert_difference('Community.count') do
      post communities_url, params: { community: { ciudad: @community.ciudad, comuna: @community.comuna, direccion: @community.direccion, email: @community.email, fecha_constitution: @community.fecha_constitution, imagen: @community.imagen, logo: @community.logo, nombre: @community.nombre, pais: @community.pais, region: @community.region, rut: @community.rut, telefono1: @community.telefono1, telefono2: @community.telefono2 } }
    end

    assert_redirected_to community_url(Community.last)
  end

  test "should show community" do
    get community_url(@community)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_url(@community)
    assert_response :success
  end

  test "should update community" do
    patch community_url(@community), params: { community: { ciudad: @community.ciudad, comuna: @community.comuna, direccion: @community.direccion, email: @community.email, fecha_constitution: @community.fecha_constitution, imagen: @community.imagen, logo: @community.logo, nombre: @community.nombre, pais: @community.pais, region: @community.region, rut: @community.rut, telefono1: @community.telefono1, telefono2: @community.telefono2 } }
    assert_redirected_to community_url(@community)
  end

  test "should destroy community" do
    assert_difference('Community.count', -1) do
      delete community_url(@community)
    end

    assert_redirected_to communities_url
  end
end
