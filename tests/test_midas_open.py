import os
import pandas
import pytest
import datetime
from opencdms import MidasPgOpen


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DB_URL = os.path.join(BASE_DIR, "opencdms_test_data","data")


@pytest.fixture
def session():
    return MidasPgOpen(connection_string=DB_URL)


def test_should_return_hourly_wind_obs(session):
    filters = {
        'src_id': 838,
        'period': 'hourly',
        'year': 1991,
        'elements': ['wind_speed', 'wind_direction'],
    }

    obs = session.obs(**filters)

    assert isinstance(obs, pandas.DataFrame)

    assert (
        datetime.datetime.strptime(
            obs.iloc[1]["ob_time"], '%Y-%m-%d %H:%M:%S'
        )
        -
        datetime.datetime.strptime(
            obs.iloc[0]["ob_time"], '%Y-%m-%d %H:%M:%S'
        )
    ).seconds == 3600


def test_should_return_hourly_rain_prcp_amt_obs(session):
    filters = {
        'src_id': 838,
        'period': 'hourly',
        'year': 1991,
        'elements': ['prcp_amt'],
    }

    obs = session.obs(**filters)

    assert isinstance(obs, pandas.DataFrame)

    assert (
        datetime.datetime.strptime(
            obs.iloc[1]["ob_end_time"], '%Y-%m-%d %H:%M:%S'
        )
        -
        datetime.datetime.strptime(
            obs.iloc[0]["ob_end_time"], '%Y-%m-%d %H:%M:%S'
        )
    ).seconds == 3600


def test_should_return_daily_rain_prcp_amt_obs(session):

    filters = {
        'src_id': 838,
        'period': 'daily',
        'year': 1991,
        'elements': ['prcp_amt'],
    }

    obs = session.obs(**filters)

    assert isinstance(obs, pandas.DataFrame)
    assert (
        datetime.datetime.strptime(
            obs.iloc[2]["ob_date"], '%Y-%m-%d %H:%M:%S'
        )
        -
        datetime.datetime.strptime(
            obs.iloc[1]["ob_date"], '%Y-%m-%d %H:%M:%S'
        )
    ).days == 1


def test_should_return_daily_temperature_obs(session):
    filters = {
        'src_id': 838,
        'period': 'daily',
        'year': 1991,
        'elements': ['max_air_temp', 'min_air_temp'],
    }

    obs = session.obs(**filters)

    assert isinstance(obs, pandas.DataFrame)

    assert (
        datetime.datetime.strptime(
            obs.iloc[2]["ob_end_time"], '%Y-%m-%d %H:%M:%S'
        )
        -
        datetime.datetime.strptime(
            obs.iloc[1]["ob_end_time"], '%Y-%m-%d %H:%M:%S'
        )
    ).days == 1


def test_should_return_daily_radiation_obs(session):
    filters = {
        'src_id': 838,
        'period': 'daily',
        'year': 1991,
        'elements': ['glbl_irad_amt', 'difu_irad_amt'],
    }

    obs = session.obs(**filters)

    assert isinstance(obs, pandas.DataFrame)

    assert (
        datetime.datetime.strptime(
            obs.iloc[2]["ob_end_time"], '%Y-%m-%d %H:%M:%S'
        )
        -
        datetime.datetime.strptime(
            obs.iloc[1]["ob_end_time"], '%Y-%m-%d %H:%M:%S'
        )
    ).seconds == 3600


def test_should_return_daily_soil_temperature_obs(session):
    filters = {
        'src_id': 838,
        'period': 'daily',
        'year': 1991,
        'elements': ['q5cm_soil_temp', 'q10cm_soil_temp'],
    }

    obs = session.obs(**filters)

    assert isinstance(obs, pandas.DataFrame)

    assert (
        datetime.datetime.strptime(
            obs.iloc[2]["ob_time"], '%Y-%m-%d %H:%M:%S'
        )
        -
        datetime.datetime.strptime(
            obs.iloc[1]["ob_time"], '%Y-%m-%d %H:%M:%S'
        )
    ).days == 1



