module TestBadgerfishEdgeCases
  def test_badgerfish_edge_case_nr_1
    xml = '<root><a></a><b/></root>'
    expected_json = <<-json
      {
        "root": {
          "a": {
            "$": ""
          },
          "b": null
        }
      }
    json

    assert_badgerfish xml, expected_json
  end
end
