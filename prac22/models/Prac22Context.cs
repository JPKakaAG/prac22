using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace prac22.models;

public partial class Prac22Context : DbContext
{
    public Prac22Context()
    {
    }

    public Prac22Context(DbContextOptions<Prac22Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Filtr> Filtrs { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Страны> Страныs { get; set; }

    public virtual DbSet<ЭтническийСостав> ЭтническийСоставs { get; set; }

    public virtual DbSet<Языки> Языкиs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DESKTOP-I00R4RJ\\MSSQLSERVER01; Database=prac22; User=sa; Password=1234567890; Encrypt=false");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Filtr>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("Filtr");

            entity.Property(e => e.КодСтраны)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Код_страны");
            entity.Property(e => e.КодЯзыка)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Код_языка");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Idrole).HasName("PK__Roles__8A8B0B9A5CEBEF32");

            entity.Property(e => e.Idrole).ValueGeneratedNever();
            entity.Property(e => e.Role1)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Iduser).HasName("PK__Users__778B892120F123DB");

            entity.Property(e => e.Iduser).ValueGeneratedNever();
            entity.Property(e => e.Login)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Patronymic)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Surname)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdroleNavigation).WithMany(p => p.Users)
                .HasForeignKey(d => d.Idrole)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Users__Idrole__412EB0B6");
        });

        modelBuilder.Entity<Страны>(entity =>
        {
            entity.HasKey(e => e.КодСтраны).HasName("PK__Страны__9DD3796292C60D0F");

            entity.ToTable("Страны");

            entity.Property(e => e.КодСтраны)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Код_страны");
            entity.Property(e => e.Материк)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.НазваниеСтраны)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("Название_страны");
            entity.Property(e => e.Столица)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ЭтническийСостав>(entity =>
        {
            entity.HasKey(e => new { e.КодСтраны, e.Год, e.КодЯзыка }).HasName("PK__Этническ__0599061353CCB907");

            entity.ToTable("Этнический_состав");

            entity.Property(e => e.КодСтраны)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Код_страны");
            entity.Property(e => e.КодЯзыка)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Код_языка");
            entity.Property(e => e.НаселениеГоворящихНаЯзыке).HasColumnName("Население_говорящих_на_языке");

            entity.HasOne(d => d.КодСтраныNavigation).WithMany(p => p.ЭтническийСоставs)
                .HasForeignKey(d => d.КодСтраны)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Этнически__Код_с__3B75D760");

            entity.HasOne(d => d.КодЯзыкаNavigation).WithMany(p => p.ЭтническийСоставs)
                .HasForeignKey(d => d.КодЯзыка)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Этнически__Код_я__3C69FB99");
        });

        modelBuilder.Entity<Языки>(entity =>
        {
            entity.HasKey(e => e.КодЯзыка).HasName("PK__Языки__F4E45490372F24C8");

            entity.ToTable("Языки");

            entity.Property(e => e.КодЯзыка)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Код_языка");
            entity.Property(e => e.ВидЗнаковойСистемы)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Вид_знаковой_системы");
            entity.Property(e => e.НазваниеЯзыка)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("Название_языка");
            entity.Property(e => e.ЯзыковаяГруппа)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Языковая_группа");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
