"""seed core table

Revision ID: 098804e8a58a
Revises: 5a2477531ed6
Create Date: 2025-04-28 23:17:52.476453

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

from utils.database import Session
from utils.base_model import EksSample

# revision identifiers, used by Alembic.
revision: str = '098804e8a58a'
down_revision: Union[str, None] = '5a2477531ed6'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    data = EksSample()
    data.key = 'hello'
    data.value = 'Hello World!'

    with Session() as session:
        session.commit()
        session.begin()
        try:
            session.add(data)
        except:
            session.rollback()
            raise
        else:
            session.commit()


def downgrade() -> None:
    """Downgrade schema."""
    pass
