package com.umar.recruiter.candidateRepo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.umar.recruiter.entity.Candidate;

public interface CandidateRepository extends JpaRepository<Candidate, Long> {

    List<Candidate> findByNameContainingIgnoreCaseOrQualificationContainingIgnoreCaseOrDesignationContainingIgnoreCaseOrPosition_PositionNameContainingIgnoreCase(
            String name, 
            String qualification, 
            String designation, 
            String positionName);
    
    List<Candidate> findByPositionId(Long id);
}
