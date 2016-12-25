package com.fish.idle.site.shiro.security;

import org.apache.shiro.session.Session;

import java.io.Serializable;
import java.util.Collection;

public interface ShiroSessionRepository {

    void saveSession(Session session);

    void deleteSession(Serializable sessionId);

    Session getSession(Serializable sessionId);

    Collection<Session> getAllSessions();
}
