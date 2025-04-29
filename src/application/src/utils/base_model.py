from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column

class Base(DeclarativeBase):
    pass

class EksSample(Base):
    __tablename__ = "eks_sample"

    key: Mapped[str] = mapped_column(primary_key=True)
    value: Mapped[str]

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__tablename__.columns}
