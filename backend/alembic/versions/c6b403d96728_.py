"""empty message

Revision ID: c6b403d96728
Revises: 0a5b33fc5ff5
Create Date: 2025-02-15 17:38:42.462043

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'c6b403d96728'
down_revision: Union[str, None] = '0a5b33fc5ff5'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('user_account', sa.Column('is_private', sa.Boolean(), nullable=False))
    op.create_unique_constraint(None, 'user_account', ['email'])
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'user_account', type_='unique')
    op.drop_column('user_account', 'is_private')
    # ### end Alembic commands ###
