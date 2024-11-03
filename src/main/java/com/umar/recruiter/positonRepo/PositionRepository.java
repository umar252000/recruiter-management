package com.umar.recruiter.positonRepo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.umar.recruiter.entity.Position;

public interface PositionRepository extends JpaRepository<Position, Long> {
}
