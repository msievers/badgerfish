module TestBadgerfishNingCom 

  def test_badgerfish_ning_com_nr_2
    xml = '<alice>bob</alice>'
    expected_json = <<-json
      {
        "alice":{
          "$":"bob"
        }
      }
    json

    assert_badgerfish xml, expected_json
  end

  def test_badgerfish_ning_com_nr_3
    xml = '<alice><bob>charlie</bob><david>edgar</david></alice>'
    expected_json = <<-json
      {
        "alice":{
          "bob":{
            "$":"charlie"
          },
          "david":{
            "$":"edgar"
          }
        }
      }
    json

    assert_badgerfish xml, expected_json
  end

  def test_badgerfish_ning_com_nr_4
    xml = '<alice><bob>charlie</bob><bob>david</bob></alice>'
    expected_json = <<-json
      {
        "alice":{
          "bob":[
            {
              "$":"charlie"
            },
            {
              "$":"david"
            }
          ]
        }
      }
    json

    assert_badgerfish xml, expected_json
  end

  def test_badgerfish_ning_com_nr_5
    xml = '<alice charlie="david">bob</alice>'
    expected_json = <<-json
      {
        "alice":{
          "@charlie":"david",
          "$":"bob"
        }
      }
    json

    assert_badgerfish xml, expected_json
  end

  def test_badgerfish_ning_com_nr_7
    xml = '<alice xmlns="http://some-namespace">bob</alice>'
    expected_json = <<-json
      {
        "alice":{
          "@xmlns":{
            "$":"http://some-namespace"
          },
          "$":"bob"
        }
      }
    json

    assert_badgerfish xml, expected_json
  end

  def test_badgerfish_ning_com_nr_8
    xml = <<-xml
      <alice xmlns="http://some-namespace" xmlns:charlie="http://some-other-namespace">bob</alice>
    xml
    expected_json = <<-json
      {
        "alice":{
          "@xmlns":{
            "$":"http://some-namespace",
            "charlie":"http://some-other-namespace"
          },
          "$":"bob"
        }
      }
    json

    assert_badgerfish xml, expected_json
  end

  def test_badgerfish_ning_com_nr_9
    skip("child node namespaces not supported yet")

    xml = <<-xml
      <alice xmlns="http://some-namespace" xmlns:charlie="http://some-other-namespace">
        <bob>david</bob>
        <charlie:edgar>frank</charlie:edgar>
      </alice>
    xml

    expected_json = <<-json
    {
      "alice":{
        "@xmlns":{
          "$":"http://some-namespace",
          "charlie":"http://some-other-namespace"
        },
        "bob":{
          "@xmlns":{
            "$":"http://some-namespace",
            "charlie":"http://some-other-namespace"
          },
          "$":"david"
        },
        "charlie:edgar":{
          "$":"frank",
          "@xmlns":{
            "$":"http://some-namespace",
            "charlie":"http://some-other-namespace"
          }
        }
      }
    }
    json

    assert_badgerfish xml, expected_json
  end

end
