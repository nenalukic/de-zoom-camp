if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    print("Rows with zero passengers:", (data[['passenger_count', 'trip_distance']].isin([0]).sum()))

    data.columns = (data.columns
                    .str.replace(' ', '_')
                    .str.lower()
    )

    return data[(data['passenger_count'] > 0) & (data['trip_distance'] > 0)]

  


@test
def test_output(output, *args) -> None:
   assert output ['passenger_count'].isin([0]).sum() == 0
   assert output ['trip_distance'].isin([0]).sum() == 0
